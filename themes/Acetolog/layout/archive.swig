{% extends './includes/base.swig' %}

{% block content %}
 <div class="dis_flex_center al_lightbox_cnt al_full_cover">
        <img class="al_lightbox_img"/>
    </div>
    <div class="al_page_background dis_flex_center al_full_cover"></div>
    <div class="al_page_container">
        <div class="al_pos_ab al_fake_background"></div>
        <div class="al_main_container al_shadow al_main_page_container">
            <h1 class="archive_title">文章归档</h1>
            <div class="archive_box">
                <ul>
                {% for item in page.posts %}
                    {% if year != item.date | date('Y') %}
                        {% set year = item.date | date('Y') %}
                        <li class="archive_li_year">{{ year }}年</li>
                    {% endif %}
                        <li class="archive_li_item">
                            <a class="archive_post_link" 
                            href="{{ url_for(item.link || item.path) }}">
                            📖 {{ item.title }}
                            </a>
                            <span>&emsp;{{item.date | date('M, d')}}</span>
                        </li>
                {% endfor %}
                </ul>
            </div>
        </div>
    </div>

{% endblock %}