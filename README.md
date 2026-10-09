# Academic Progress Tracker (Netlify + Supabase)

## 1. Supabase (free tier)
1. Create a project at supabase.com.
2. SQL Editor: paste and run `supabase.sql`.
3. Project Settings > API: copy the Project URL and the anon public key into `config.js`.
4. Authentication > URL Configuration: set Site URL to your Netlify URL (add it after step 3 below), and add it to Redirect URLs.

## 2. Deploy
1. Push this folder to a GitHub repo.
2. Netlify: Add new site > Import from Git > pick the repo. No build command, publish directory is `.`.
3. Site configuration > Environment variables:
   - SUPABASE_URL, SUPABASE_ANON_KEY (same as config.js)
   - ANTHROPIC_API_KEY (console.anthropic.com; set a monthly spend limit there)
   - ANTHROPIC_MODEL (optional)
4. Redeploy. Add a custom domain under Domain management if you want one.

## 3. Test locally
`npx netlify dev` then open the printed URL.

## Notes
- The anon key is public by design. Row Level Security keeps each user's row private.
- The AI coach requires sign in and sends only course codes and grades.
- Without Supabase configured, the app still works and saves on the device.
- Bump `V` in `sw.js` when you change files, so installed apps update.
- Next step if the coach is abused: add per-user rate limiting in `coach.mjs`.
