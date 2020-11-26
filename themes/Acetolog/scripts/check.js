/**
 * Note: configs in _data/token.yml will replace configs in hexo.theme.config.
 */
hexo.on('generateBefore', function() {
    if (hexo.locals.get) {
        var data = hexo.locals.get('data')
        data && data.token && (hexo.theme.config = data.token)
    }
})