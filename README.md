# formbricks-amaqueme

Thin image used by amaqueme.mx: the official `ghcr.io/formbricks/formbricks:4.5.0` image with only
the in-app survey widget bundle (`surveys.umd.cjs`, `surveys.js`) replaced by a build that does not
render the "Powered by Formbricks" footer.

- What changes: `packages/surveys/src/components/general/formbricks-branding.tsx` returns `null`
  (see `patched/formbricks-branding.patched.tsx`). `packages/surveys` is **MIT** licensed upstream.
- What does not change: the Formbricks server/panel (AGPLv3) and anything under `apps/web/modules/ee`.
  No license key or enterprise feature is touched or bypassed.
- Upstream license text (copyright notices): `FORMBRICKS-LICENSE`.

## Rebuild for another Formbricks version
```bash
git clone --depth 1 --branch <TAG> https://github.com/formbricks/formbricks.git
cd formbricks
cp /path/to/this/repo/patched/formbricks-branding.patched.tsx packages/surveys/src/components/general/formbricks-branding.tsx
pnpm install --frozen-lockfile --ignore-scripts --filter "@formbricks/surveys..."
pnpm --filter "@formbricks/surveys..." build
cp apps/web/public/js/surveys.umd.cjs apps/web/public/js/surveys.js /path/to/this/repo/patched/
# then bump the tag in the Dockerfile
```
