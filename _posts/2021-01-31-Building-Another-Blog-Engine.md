---
layout: post
title:  Building Another Blog Engine
date:   2021-01-31
---

I have some ideas for a blog engine I want to explore. Instead of creating a new website, I'm planning to make incremental changes/improvements to this website. Baby steps. That's why I've named this project BABE: Building Another Blog Engine.

At the moment I'm using GitHub Pages for this blog. When I push a commit, GitHub schedules a task of transforming the source via Jekyll. And the resulting files live somewhere on a webserver. It's convenient, but it doesn't give me the control I need.

Step one is to build the website local, and commit+push the resulting files to GitHub. I don't want to create another repository for the build result, as this adds confusion. Fortunate, _git_ has a nice solution for this. Create a branch for Jekyll's build result, and tell GitHub Pages to serve the website from there.

This branch should contain no files other than the build result. The obvious choice to do this would be to create a branch and remove all files. But why not use the powers of _git_ and create a branch from the initial commit, way in the past!

	initial_hash=$(git rev-list HEAD | tail -n 1)
	git branch web-stek $initial_hash

We now have an (almost) empty branch. How do we get the output from Jekyll's build command to this branch? 

Jekyll's output ends up in the `_site` folder. Since this folder is already in the `.gitignore` file, the files will stay untouched when switching branches.

	jekyll build
	git checkout web-stek

After the branch swap, we need to add the folders `.jekyll-cache` and `.sass-cache` to the (new) `.gitignore` file. Also, some empty folders might be there, because git only works with actual files. Finally, you might want to remove the files from the initial commit in the branch.

I compared the result in `_site` with GitHub's copy by fetching the pages via `wget -r https\://blog.zanstra.com`. I only found one major difference. GitHub Pages would normalize time-zone offsets to zero. That might be an issue for RSS readers, but I can live with it.

When pushing the changes to GitHub and changing the settings for the [publication source][github-pages] I ran into a problem.  You can only choose `/` (root) or the `/docs` as a publishing source. The problem is easy to fix. Rename the `_site` folder in the `web-stek` branch. In the default branch add a line to `_config.yml` with the text `destination: ./docs`. This will override the default `_site` folder. Don't forget to add `docs` to the `.gitignore` file. 

So after pushing all this, and setting up the publication source you are good to go. The next step is to automate publishing, but that has to wait for an other time. 

[github-pages]: https://docs.github.com/en/github/working-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site

