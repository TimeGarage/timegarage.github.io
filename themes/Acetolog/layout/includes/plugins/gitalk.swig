{%  if site.data.token.gitalk.enable %}
    <div id="al_gitalk_cnt">
    <script src="//cdn.jsdelivr.net/npm/gitalk@1/dist/gitalk.min.js"></script>
    <script>
        var gitalk = new Gitalk({
            clientID: "{{ site.data.token.gitalk.clientID }}",
            clientSecret: "{{ site.data.token.gitalk.clientSecret }}",
            repo: "{{ site.data.token.gitalk.repo }}",
            owner: "{{ site.data.token.gitalk.owner }}",
            admin: "{{ site.data.token.gitalk.admin }}",
            id: "{{ page.title.slice(0, 50) }}",
        });
        gitalk.render("al_gitalk_cnt")
    </script>