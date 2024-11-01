# coding: utf-8
import feedparser
from bottle import route, run, template
from bottle import TEMPLATE_PATH, jinja2_template as template #jinjaを使うように変えてます


@route('/')
def index():
    return template('top') #topのテンプレートを指定してます



if __name__ == '__main__':

    run(host='0.0.0.0', port=8081, debug=True, reloader=True)