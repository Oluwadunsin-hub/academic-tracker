create table public.trackers(
  user_id uuid primary key references auth.users on delete cascade,
  data jsonb not null,
  updated_at timestamptz not null default now());
alter table public.trackers enable row level security;
create policy "own row only" on public.trackers for all
  using (auth.uid()=user_id) with check (auth.uid()=user_id);
