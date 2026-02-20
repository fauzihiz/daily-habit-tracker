# Mutabaah (Daily Habit Tracker PWA)

Mutabaah is a highly flexible, template-driven habit tracker designed for mobile-first productivity. It allows users to track their spiritual, physical, and professional activities using a familiar grid-like interface optimized for mobile devices.

## 🚀 Vision & Key Features

- **Mobile-First Spreadsheet Design**: A sleek horizontal-scrolling grid. Keep track of your activities on the left and check them off against dates on the right.
- **Hierarchical Activities**: Organize your habits into categories (e.g., "Ibadah", "Health") with sub-activities for better organization.
- **Template System**:
    - **Create & Share**: Build your own list of tracking activities and share them with the community.
    - **Multiple Collections**: Subscribe to multiple templates simultaneously (e.g., a "Daily Habits" template and a "Ramadan Special" template).
    - **Clone & Customize**: Use templates created by others and adapt them to your needs.
- **Progressive Web App (PWA)**: Installable on your home screen with offline capabilities for seamless tracking.
- **Secure Cloud Sync**: Auto-sync data via Google or Email login.

## 🛠 Tech Stack

- **Frontend**: Next.js 15 (App Router), TypeScript
- **Styling**: Tailwind CSS, Lucide Icons, Shadcn/UI
- **Backend/Auth**: Supabase (PostgreSQL)
- **Deployment**: Vercel
- **PWA Integration**: `next-pwa`

## 🗺 Roadmap

### Phase 1: Foundation (Auth & Infrastructure)
- [ ] Initialize Next.js & Supabase project.
- [ ] Setup Google & Email Authentication.
- [ ] Implement Middleware for page protection.

### Phase 2: The Core Grid & Database
- [ ] Design Database Schema (Templates, Categories, Activities, Logs).
- [ ] Build the "Mutabaah Grid": Sticky activity names with horizontal date scrolling.
- [ ] Implement auto-saving checkmarks to Supabase.

### Phase 3: Template Sharing & Social
- [ ] UI for "Template Creator" and "Template Sharing".
- [ ] Public Gallery for community templates.
- [ ] Dashboard logic to switch between active templates.

### Phase 4: PWA & Optimization
- [ ] Setup PWA manifest and service workers.
- [ ] Enable offline data persistence.
- [ ] UI/UX polish for a premium, native-app feel.
