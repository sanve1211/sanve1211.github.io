#!/bin/bash

# Create basic directory structure
mkdir -p _layouts _includes _posts assets/css

# Create _config.yml
cat > _config.yml << 'EOL'
title: Your Academic Site
description: A site for my academic research
url: "https://sanve1211.github.io"
github_username: sanve1211
markdown: kramdown
theme: minima
EOL

# Create index.md
cat > index.md << 'EOL'
---
layout: home
---

# Welcome to My Academic Website

I am a researcher focusing on [your research areas]. This site contains information about my research, publications, and contact information.
EOL

# Create publications.md
cat > publications.md << 'EOL'
---
layout: page
title: Publications
permalink: /publications/
---

## Journal Articles

1. Author, A., Your Name (2024). "Example Article Title." *Journal Name*, Vol(Issue), pp. XX-XX.

## Conference Papers

1. Your Name, Coauthor, B. (2023). "Example Conference Paper." *Conference Name*, Location.
EOL

# Create contact.md
cat > contact.md << 'EOL'
---
layout: page
title: Contact
permalink: /contact/
---

## Contact Information

**Email:** your.email@university.edu

**Office:** Building Name, Room XXX
University Name
City, State/Province, Country

**Social Media:**
- [Google Scholar](https://scholar.google.com/)
- [LinkedIn](https://www.linkedin.com/)
- [GitHub](https://github.com/sanve1211)
EOL

# Create default layout
cat > _layouts/default.html << 'EOL'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{ page.title | default: site.title }}</title>
  <link rel="stylesheet" href="/assets/css/style.css">
</head>
<body>
  <header>
    <h1><a href="/">{{ site.title }}</a></h1>
    <nav>
      <ul>
        <li><a href="/">Home</a></li>
        <li><a href="/publications/">Publications</a></li>
        <li><a href="/contact/">Contact</a></li>
      </ul>
    </nav>
  </header>
  <main>
    {{ content }}
  </main>
  <footer>
    <p>&copy; {{ site.time | date: "%Y" }} {{ site.title }}. All rights reserved.</p>
  </footer>
</body>
</html>
EOL

# Create page layout
cat > _layouts/page.html << 'EOL'
---
layout: default
---
<h1>{{ page.title }}</h1>
{{ content }}
EOL

# Create home layout
cat > _layouts/home.html << 'EOL'
---
layout: default
---
{{ content }}

{% if site.posts.size > 0 %}
<h2>Recent Updates</h2>
<ul>
  {% for post in site.posts limit:5 %}
  <li>
    <span>{{ post.date | date: "%b %d, %Y" }}</span>
    <a href="{{ post.url }}">{{ post.title }}</a>
  </li>
  {% endfor %}
</ul>
{% endif %}
EOL

# Create CSS
cat > assets/css/style.css << 'EOL'
body {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, sans-serif;
  line-height: 1.6;
  color: #333;
  max-width: 800px;
  margin: 0 auto;
  padding: 2rem 1rem;
}

header {
  margin-bottom: 2rem;
  border-bottom: 1px solid #eee;
  padding-bottom: 1rem;
}

nav ul {
  display: flex;
  padding: 0;
  list-style: none;
}

nav ul li {
  margin-right: 1.5rem;
}

a {
  color: #0366d6;
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

footer {
  margin-top: 2rem;
  padding-top: 1rem;
  border-top: 1px solid #eee;
  font-size: 0.8rem;
  color: #777;
}
EOL

# Create sample post
mkdir -p _posts
cat > _posts/2025-03-15-research-update.md << 'EOL'
---
layout: post
title: "Research Update"
date: 2025-03-15
---

This is a sample research update post. You can share news about your recent publications, conference presentations, or research developments here.
EOL

# Create .gitignore
cat > .gitignore << 'EOL'
_site/
.sass-cache/
.jekyll-cache/
.jekyll-metadata
vendor/
.bundle/
EOL

# Create Gemfile
cat > Gemfile << 'EOL'
source "https://rubygems.org"
gem "github-pages", group: :jekyll_plugins
gem "webrick", "~> 1.7"
EOL

echo "Academic site structure created successfully!"
