# Local Development Setup

This guide explains how to set up Jekyll locally for development and testing of the Analytiq Hub website.

## Prerequisites

### Make
Install Make to use the project's build commands:
- **macOS**: Included with Xcode Command Line Tools: `xcode-select --install`
- **Linux**: Usually pre-installed, or install with package manager (e.g., `sudo apt install build-essential` on Ubuntu)
- **Windows**: Install via [Chocolatey](https://chocolatey.org/): `choco install make`

### Ruby Environment
1. **Install Ruby** (version 2.7 or higher recommended):
   - **macOS**: Use Homebrew: `brew install ruby`
   - **Linux**: Use your package manager (e.g., `sudo apt install ruby ruby-dev` on Ubuntu)
   - **Windows**: Use [RubyInstaller](https://rubyinstaller.org/)

2. **Verify Ruby installation**:
   ```bash
   ruby --version
   gem --version
   ```

### Bundler
Install Bundler to manage gem dependencies:
```bash
gem install bundler
```

## Installation

1. **Clone the repository** (if not already done):
   ```bash
   git clone <repository-url>
   cd analytiq-hub.github.io
   ```

2. **Install dependencies**:
   ```bash
   make install
   ```
   
   This will install Jekyll and all required plugins specified in the `Gemfile`.

## Running the Development Server

1. **Start the development server**:
   ```bash
   make dev
   ```

2. **Access the website**:
   Open your browser and navigate to `http://localhost:4000`

The development server will automatically regenerate pages when you make changes to files.

## Development Workflow

### File Structure
The site uses a custom Tailwind CSS setup with modular includes:
- `_includes/` - Reusable components (head, header, footer)
- `_layouts/` - Page templates
- `_posts/` - Blog posts
- `assets/` - Static assets (CSS, JS, images)

### Making Changes
1. Edit files as needed
2. The development server will auto-reload changes
3. Check the terminal for any build errors
4. Refresh your browser to see changes

## Testing Before Deployment

### 1. Build the Site
Test the production build:
```bash
make build
```

This creates a `_site/` directory with the generated static files.

### 2. Serve the Built Site
Test the production build locally:
```bash
bundle exec jekyll serve --no-watch
```

### 3. Check for Issues
- **Broken links**: Manually check navigation and internal links
- **Responsive design**: Test on different screen sizes
- **Performance**: Check page load times
- **Content**: Verify all content displays correctly

### 4. Validate HTML (Optional)
Install and use HTML validator:
```bash
gem install html-proofer
bundle exec htmlproofer ./_site
```

## Common Commands

| Command | Purpose |
|---------|---------|
| `make install` | Install/update dependencies |
| `make dev` | Start development server |
| `make build` | Build site for production |
| `make clean` | Clean generated files |

## Troubleshooting

### Port Already in Use
If port 4000 is busy, specify a different port:
```bash
bundle exec jekyll serve --port 4001
```

### Bundle Install Issues
If you encounter gem installation issues:
```bash
bundle clean --force
bundle install
```

### Ruby Version Issues
Ensure you're using a compatible Ruby version. Check `.ruby-version` if present, or use a Ruby version manager like rbenv or RVM.

## Deployment Notes

This site is configured for GitHub Pages deployment. The `github-pages` gem ensures compatibility with GitHub's Jekyll environment.

**Before pushing changes:**
1. Run `make build` to ensure the site builds successfully
2. Test the built site locally
3. Check for any console errors in the browser
4. Verify responsive design works correctly

The site will automatically deploy when changes are pushed to the main branch.