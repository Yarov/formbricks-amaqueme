# Official Formbricks image + a rebuilt survey widget bundle (packages/surveys, MIT) without the
# "Powered by Formbricks" footer. The Formbricks panel/server code (AGPLv3) is NOT modified.
FROM ghcr.io/formbricks/formbricks:4.5.0
COPY --chown=nextjs:nextjs patched/surveys.umd.cjs patched/surveys.js /home/nextjs/apps/web/public/js/
