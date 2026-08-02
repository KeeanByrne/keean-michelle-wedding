-- Wedding RSVP table for Michelle & Keean
-- Run this in Supabase: SQL Editor -> New query -> paste -> Run

create table if not exists public.rsvps (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  attending boolean not null,
  guest_count integer not null default 0,
  food text,
  dietary text,
  song1 text,
  song2 text,
  submitted_at timestamptz not null default now()
);

alter table public.rsvps enable row level security;

-- Guests can submit RSVPs from the public site
create policy "Anyone can insert RSVPs"
  on public.rsvps
  for insert
  to anon, authenticated
  with check (true);

-- Replace the key below with the same ADMIN_KEY value from config.js
create policy "Admin can read RSVPs"
  on public.rsvps
  for select
  to anon, authenticated
  using (
    (current_setting('request.headers', true)::json->>'x-admin-key') = 'choose-a-long-random-admin-password'
  );
