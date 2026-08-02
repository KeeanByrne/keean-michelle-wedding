# Michelle & Keean — Wedding Site

Wedding landing page with RSVP responses stored in Supabase.

## Setup

### 1. Create a Supabase project

1. Go to [supabase.com](https://supabase.com) and create a free project.
2. Open **Project Settings → API** and copy:
   - Project URL
   - `anon` public key

### 2. Create the database table

1. Open **SQL Editor** in Supabase.
2. Paste the contents of `supabase/schema.sql`.
3. Change `choose-a-long-random-admin-password` in the admin policy to a strong password you will remember.
4. Run the query.

### 3. Configure the site

1. Copy `config.example.js` to `config.js` if needed.
2. Edit `config.js` with your Supabase URL, anon key, and the same admin password from step 2.

### 4. Test locally

```bash
cd michelle-keean-wedding
python3 -m http.server 8080
```

Open `http://localhost:8080`, submit a test RSVP, then open `http://localhost:8080/#responses` and enter your admin password.

### 5. Deploy to GitHub Pages

1. Push this repo to GitHub.
2. Go to **Settings → Pages**.
3. Set source to **Deploy from a branch**.
4. Choose `main` and `/ (root)`.
5. Save. Your site will be live at `https://<username>.github.io/<repo-name>/`.

`config.js` must be committed for GitHub Pages to work. The Supabase anon key is safe to expose in the browser. Keep your admin password private — it protects the `#responses` view.

## Admin view

Visit your site with `#responses` at the end of the URL, for example:

`https://your-site.github.io/michelle-keean-wedding/#responses`

Enter your admin password to see all submissions, counts, and meal choices.

You can also view responses directly in the Supabase dashboard under **Table Editor → rsvps**.
