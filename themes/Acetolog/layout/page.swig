{% extends './includes/base.swig' %}

{% block content %}
 <div class="dis_flex_center al_lightbox_cnt al_full_cover">
        <img class="al_lightbox_img"/>
    </div>
    <div class="al_page_background dis_flex_center al_full_cover"></div>
    <div class="al_page_container">
        <div class="al_pos_ab al_fake_background"></div>
        <div class="al_main_container al_shadow al_main_page_container">
        <article class="al_article">
        <h1 class="archive_title">{{ page.title | default('No Title')}}</h1>
                <section id="post-body">
                    {{ page.content }}
                </section>
        </article>
        </div>
    </div>

{% endblock %}