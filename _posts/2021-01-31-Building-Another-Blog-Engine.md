---
layout: post
title:  Building Another Blog Engine
date:   2021-01-31
---

I have some ideas for a blog engine I want to explore. Instead of creating a new website, I'm planning to make incremental changes/improvements to this website. Baby steps. That's why I've named this project BABE: Building Another Blog Engine.

At the moment I'm using GitHub Pages for this blog. When I push a commit, GitHub schedules a task of transforming the source via Jekyll. And the resulting files live somewhere on a webserver. It's convenient, but it doesn't give me the control I need.

Step one is to build the website local, and push the resulting files to GitHub. I don't want to create another repository for the build result, as this adds confusion. Fortunate, _git_ has a nice solution for this. Create a branch for Jekyll's build result, and tell GitHub Pages to serve the website from there.

This branch should contain no files other than the build result. The obvious choice to do this would be to create a branch and remove all files. But why not use the powers of _git_ and create a branch from the initial commit, way in the past!

	initial_hash=$(git rev-list HEAD | tail -n 1)
	git branch web-stek $initial_hash

We now have an (almost) empty branch. How do we get the output from Jekyll's build command to this branch? 

One way might be by having the ignored folder `_site` (which contains the Jekyll build result) on the _master_ branch. Somehow  bring the changes to the _web-stek_ branch by switching branches. That would work with new files, but I don't know how to transfer _modified_ files this way.

Two alternatives come to mind. Either use two _git_ repositories on the same machine in different folders. Or use an intermediate folder for Jekyll's build result. For simplicity and less confusion, I've chosen to work with an intermediate folder.

In the example below, _rsync_ transfers the build result to the `/docs` folder instead of `/_site`. I've changed the name, because `/_site` is not listed with the settings for the [publication source][github-pages] on GitHub Pages. So `/docs` it is. The build process works like this:

	jekyll build --destination "$jekyll_build"
	git checkout web-stek
	rsync -av "$jekyll_build" ./docs/

To finish up, I need to add the folders `.jekyll-cache` and `.sass-cache` to the `.gitignore` file on the _web-stek_ branch. Also, some empty folders might be there, because git only works with actual files. Finally, you might want to remove the files from the initial commit in the branch.

I compared the result in `/docs` with GitHub's copy by fetching the pages via `wget -r https\://blog.zanstra.com`. I only found one major difference. GitHub Pages would normalizes time-zone offsets to zero. That might be an issue for RSS readers, but I can live with it.

So after pushing all this, and setting up the publication source you are good to go. The next step is to automate publishing, but that has to wait for an other time.

[github-pages]: https://docs.github.com/en/github/working-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site

