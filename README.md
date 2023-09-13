# Gem_Translator
Made using Rapid Api (Text Translator).
Translate text to 100+ languages. Fast processing, cost saving. Free up to 100,000 characters per month.

## Install

```shell
gem install my_gem
```

## Use (Sample)
```shell
require 'Gem_Translator'

translator = Translator.new('en', 'ru', 'api') #First - source language, second - target language, api - your api from https://rapidapi.com/dickyagustin/api/text-translator2 (must registred)
puts translator.translate('Yellow submarine') #Prompt for translate
```

### Methods

**#translate('String')** - translate prompt \
**#change_source_lang('String')** -  change source language \
**#change_target_lang('String')** -  change target language \
**#view_code_all** - view all available language codes \
**#view_code('String')** - view the code for a specific language