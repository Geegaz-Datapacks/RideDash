from beet import Context, PluginOptions, configurable

class GSheetsTranslationsOptions(PluginOptions):
    clear_cache: bool = False
    sheet_id: int = 0
    spreadsheet_id: str
    output: str = "sheet.csv"

def beet_default(ctx: Context):
    ctx.require(gsheets_translations)

@configurable(validator=GSheetsTranslationsOptions)
def gsheets_translations(ctx: Context, opts: GSheetsTranslationsOptions):
    url = f'https://docs.google.com/spreadsheets/d/{opts.spreadsheet_id}/export?format=csv&gid={opts.sheet_id}'
    
    c = ctx.cache["translations"]
    if opts.clear_cache:
        c.clear() # Force clear cache to update the translations
    result = c.download(arg = url, path = c.directory.joinpath(opts.output))
    
