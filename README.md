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

Pick whichever works on your Unraid version:

- **Template Repositories field:** On the *Docker* tab, switch on **Advanced View** (top right), then click **Add Container**. The *Template Repositories* box is on that page. Some releases show it under *Settings > Docker* instead. Add this repo's URL there and click *Save*. The field is not present on every release.
- **Manual install (always works):** Copy the XML you want from `templates/` to `/boot/config/plugins/dockerMan/templates-user/` on the Unraid flash drive. It then appears under *Docker > Add Container > Template* in the *User templates* list.
- **Community Applications:** Submit the repo to the CA team via the [Unraid forum](https://forums.unraid.net/forum/38-docker-containers/) so the apps show up in the Apps tab.
