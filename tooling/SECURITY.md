
Ensure that we have:
- make build            - build for local development. `webpack -w` in fact
- make testBuild        - build for tests. Local and remote
- make productionBuild  - optimized build for staging and production

AWS users:
- masstodon dev

AWS roles:
- Upload to test
- Upload to production

AWS policies:
- Uploading to specific S3 Enpoints


Right now only a TEST policy is in place

## Enpoints

### Backend
Not know now


### GUI - FRONT :
- Test:       test.masstodon.com
- Production: masstodon.com
