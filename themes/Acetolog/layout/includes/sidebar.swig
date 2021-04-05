<div class="al_sidebar">

    <div class="al_sidebar_overlay al_full_cover"></div>

    <div class="al_pos_fixed al_sidebar_cnt">
        <div class="dis_flex_acenter al_sidebar_header">
            <h3>{{ config.title }}</h3>
            <div class="al_sidebar_close al_header_setting">
                <svg class="al_header_icon">
                    <use xmlns="http://www.w3.org/2000/svg" xlink:href="/assets/svg_icons.svg#svg-close"></use>
                </svg>
            </div>
        </div>

        <div class="al_sidebar_author_cnt">

            <div class="al_sidebar_author_info">
                <h4>自我介绍</h4>
                <p>你好，我是彭俊，一名热爱数据分析与软件开发的学生，致力于运用科学技术提升人们的生活体验。</p>
                <p>我现在是北京大学计算机专业的硕士研究生，即将前往腾讯公司参与前端开发的暑期实习。</p>
                <p>在闲暇时光，我喜欢带着相机去旅行，走过大街小巷，感受生活的气息。</p>
                <p>如果你想和我讨论软件开发或是摄影方面的问题，欢迎随时与我联系。</p>
            </div>

            {% if theme.contact.enable === true %}
                <div class="al_sidebar_contact_info">
                    <h4>联系方式</h4>
                    <p>电子邮箱: {{ theme.contact.email }}</p>
                    <p>微信: {{ theme.contact.wechat }}</p>

                    <div class="dis_flex al_sidebar_social_widget">
                        {# github widget #}
                        {% if theme.contact.github.enable === true %}
                            <div class="al_social_icon_cnt" data_link="https://www.github.com/{{ theme.contact.github.username }}">
                                <svg class="al_social_icon" id="github">
                                    <use xmlns="http://www.w3.org/2000/svg" xlink:href="/assets/svg_icons.svg#icon_github"></use>
                                </svg>
                            </div>
                        {% endif %}
                    </div>
                </div>
            {% endif %}
        </div>
    </div>
</div>
