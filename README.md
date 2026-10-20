# UnraidTemplates

Docker application templates for [Unraid](https://unraid.net), compatible with Community Applications.

## Layout

| Path | Purpose |
| --- | --- |
| `templates/` | One XML template per app (`appname.xml`) |
| `icons/` | App icons (`appname.png`, square, ideally 256x256) |
| `ca_profile.xml` | Maintainer profile shown in Community Applications |
| `scripts/validate.sh` | Checks templates are valid XML with required fields |

## Adding an app

1. Copy `templates/_example.xml.template` to `templates/<appname>.xml`.
2. Fill in the fields; update `TemplateURL` and `Icon` (replace `OWNER` with the GitHub owner).
3. Add the icon to `icons/<appname>.png`.
4. Run `./scripts/validate.sh` (needs `xmllint` from `libxml2-utils`).

## Using the templates in Unraid

Add this repo's URL under *Docker > Template Repositories* (or submit it to Community Applications).
