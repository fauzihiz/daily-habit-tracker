import { login, signup, signInWithGoogle } from './actions'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from '@/components/ui/card'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'

import { Chrome } from 'lucide-react'

export default function LoginPage() {
    return (
        <div className="flex min-h-screen items-center justify-center bg-muted/50 p-4">
            <Card className="w-full max-w-md border-none shadow-xl">
                <CardHeader className="space-y-1 text-center">
                    <div className="flex justify-center mb-4">
                        <div className="h-12 w-12 rounded-xl bg-primary flex items-center justify-center text-primary-foreground">
                            <span className="text-2xl font-bold">M</span>
                        </div>
                    </div>
                    <CardTitle className="text-2xl font-bold tracking-tight">Welcome to Mutabaah</CardTitle>
                    <CardDescription>
                        Sign in to your account to continue tracking your habits
                    </CardDescription>
                </CardHeader>
                <CardContent className="space-y-4">
                    <form className="space-y-4">
                        <div className="space-y-2">
                            <Label htmlFor="email">Email</Label>
                            <Input id="email" name="email" type="email" placeholder="name@example.com" required />
                        </div>
                        <div className="space-y-2">
                            <Label htmlFor="password">Password</Label>
                            <Input id="password" name="password" type="password" required />
                        </div>
                        <div className="flex flex-col gap-2 pt-2">
                            <Button formAction={login} className="w-full">Sign In</Button>
                            <Button formAction={signup} variant="outline" className="w-full">Sign Up</Button>
                        </div>
                    </form>

                    <div className="relative">
                        <div className="absolute inset-0 flex items-center">
                            <span className="w-full border-t" />
                        </div>
                        <div className="relative flex justify-center text-xs uppercase">
                            <span className="bg-background px-2 text-muted-foreground">Or continue with</span>
                        </div>
                    </div>

                    <Button
                        variant="outline"
                        className="w-full relative flex items-center justify-center h-10 px-4"
                        onClick={signInWithGoogle}
                    >
                        <Chrome className="mr-2 h-4 w-4" />
                        Google
                    </Button>
                </CardContent>
                <CardFooter className="flex flex-col">
                    <p className="px-8 text-center text-sm text-muted-foreground">
                        By clicking continue, you agree to our{" "}
                        <a href="#" className="underline underline-offset-4 hover:text-primary">Terms of Service</a>{" "}
                        and{" "}
                        <a href="#" className="underline underline-offset-4 hover:text-primary">Privacy Policy</a>.
                    </p>
                </CardFooter>
            </Card>
        </div>
    )
}
