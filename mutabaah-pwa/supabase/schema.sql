-- Templates: Groups of activities created by users
CREATE TABLE templates (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  description TEXT,
  creator_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  is_public BOOLEAN DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- User Templates: Which templates each user is currently tracking
CREATE TABLE user_templates (
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  template_id UUID REFERENCES templates(id) ON DELETE CASCADE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  PRIMARY KEY (user_id, template_id)
);

-- Categories: Groups of activities within a template (e.g., "Ibadah")
CREATE TABLE categories (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  template_id UUID REFERENCES templates(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  "order" INT DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Activities: Individual items to track (e.g., "Sholat 5 Waktu")
CREATE TABLE activities (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  category_id UUID REFERENCES categories(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  type TEXT DEFAULT 'binary', -- 'binary', 'numeric', 'text'
  "order" INT DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Activity Logs: The actual tracking data
CREATE TABLE activity_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  activity_id UUID REFERENCES activities(id) ON DELETE CASCADE,
  log_date DATE NOT NULL,
  value JSONB, -- Stores { checked: true } or { amount: 5 }
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE (user_id, activity_id, log_date)
);

-- RLS Policies
ALTER TABLE templates ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_templates ENABLE ROW LEVEL SECURITY;
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE activities ENABLE ROW LEVEL SECURITY;
ALTER TABLE activity_logs ENABLE ROW LEVEL SECURITY;

-- Templates: Everyone can see public ones, creators can see/edit theirs
CREATE POLICY "Public templates are viewable by everyone" ON templates
  FOR SELECT USING (is_public = true);

CREATE POLICY "Users can manage their own templates" ON templates
  USING (auth.uid() = creator_id);

-- User Templates: Users manage their own subscriptions
CREATE POLICY "Users can manage their subscriptions" ON user_templates
  USING (auth.uid() = user_id);

-- Categories & Activities: Follow template visibility
CREATE POLICY "Viewable categories" ON categories
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM templates t 
      WHERE t.id = categories.template_id 
      AND (t.is_public = true OR t.creator_id = auth.uid())
    )
  );

-- Activity Logs: Only owners can see/edit their logs
CREATE POLICY "Users can manage their own logs" ON activity_logs
  USING (auth.uid() = user_id);
