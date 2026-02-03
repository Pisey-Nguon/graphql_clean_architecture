# 🤝 Contributing Guidelines

Thank you for contributing to this project! This document provides guidelines for contributing.

## 📋 Before You Start

1. Read [PROJECT_RULES.md](PROJECT_RULES.md) - Understand coding standards
2. Read [DEVELOPER_GUIDE.md](DEVELOPER_GUIDE.md) - Set up your environment
3. Check existing issues and PRs - Avoid duplicate work
4. Discuss major changes first - Create an issue before big PRs

---

## 🔄 Contribution Workflow

### 1. Pick or Create an Issue

**Check Existing Issues:**
- Browse open issues
- Look for issues tagged `good first issue` or `help wanted`
- Comment on the issue to claim it

**Create New Issue:**
```markdown
## Description
Clear description of the feature/bug

## Expected Behavior
What should happen

## Current Behavior
What currently happens (for bugs)

## Steps to Reproduce (for bugs)
1. Go to '...'
2. Click on '....'
3. See error

## Screenshots
If applicable

## Environment
- Device: [e.g. iPhone 12, Pixel 5]
- OS: [e.g. iOS 15, Android 12]
- App Version: [e.g. 1.0.0]
```

### 2. Create a Branch

```bash
# Update main branch
git checkout main
git pull origin main

# Create feature branch
git checkout -b feature/your-feature-name

# Or bug fix branch
git checkout -b bugfix/your-bug-fix-name
```

**Branch Naming:**
- Features: `feature/add-user-profile`
- Bug fixes: `bugfix/fix-login-crash`
- Hotfixes: `hotfix/critical-api-error`
- Docs: `docs/update-readme`
- Refactor: `refactor/optimize-queries`

### 3. Make Your Changes

**Follow These Principles:**
- ✅ Write clean, readable code
- ✅ Follow the clean architecture pattern
- ✅ Add comments for complex logic
- ✅ Keep functions small and focused
- ✅ Use meaningful variable names
- ✅ Remove console logs and debug code
- ✅ Update documentation if needed

**Test Your Changes:**
```bash
# Run analyzer
flutter analyze

# Format code
dart format .

# Run tests
flutter test

# Test on real device
flutter run
```

### 4. Commit Your Changes

**Commit Message Format:**
```
<type>: <subject>

<body (optional)>

<footer (optional)>
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding/updating tests
- `chore`: Maintenance tasks

**Examples:**
```bash
✅ Good:
git commit -m "feat: add user profile page with avatar upload"
git commit -m "fix: resolve null pointer exception in character loading"
git commit -m "docs: add API documentation for episode endpoints"

❌ Bad:
git commit -m "update"
git commit -m "fix bug"
git commit -m "changes"
```

**Commit Frequently:**
- Small, logical commits
- Each commit should work independently
- Don't mix unrelated changes

### 5. Push and Create PR

```bash
# Push your branch
git push origin feature/your-feature-name

# Create Pull Request on GitHub/GitLab
```

**Pull Request Template:**
```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Related Issue
Closes #123

## Changes Made
- Added X feature
- Fixed Y bug
- Refactored Z component

## Screenshots (if applicable)
[Add screenshots here]

## Testing
- [ ] Tested on Android
- [ ] Tested on iOS
- [ ] All tests passing
- [ ] No analyzer warnings

## Checklist
- [ ] My code follows the project's style guidelines
- [ ] I have performed a self-review
- [ ] I have commented my code where necessary
- [ ] I have updated the documentation
- [ ] My changes generate no new warnings
- [ ] I have added tests that prove my fix/feature works
- [ ] New and existing tests pass locally
```

---

## 🔍 Code Review Process

### What Reviewers Look For

1. **Functionality**
   - Does it work as intended?
   - Are edge cases handled?
   - Are errors handled gracefully?

2. **Code Quality**
   - Follows clean architecture?
   - Follows coding standards?
   - Is code readable and maintainable?
   - Are there code smells?

3. **Testing**
   - Are there tests?
   - Do tests cover important scenarios?
   - Do all tests pass?

4. **Documentation**
   - Is code documented?
   - Is README updated if needed?
   - Are breaking changes documented?

### Responding to Reviews

- **Be Open to Feedback** - Reviews help improve code quality
- **Ask Questions** - If feedback is unclear, ask for clarification
- **Make Changes Promptly** - Address comments in a timely manner
- **Discuss Disagreements** - Have constructive discussions
- **Thank Reviewers** - Appreciate their time and effort

### Review Turnaround Time

- Small PRs: 1-2 business days
- Medium PRs: 2-3 business days
- Large PRs: 3-5 business days

---

## 📏 Code Standards

### Must Follow

1. **Architecture**
   - Follow clean architecture layers
   - Domain layer must be pure Dart
   - Use dependency injection

2. **State Management**
   - Use BLoC pattern
   - Immutable states with Equatable
   - Proper error handling with Either

3. **Naming**
   - Files: `snake_case`
   - Classes: `PascalCase`
   - Variables/Methods: `camelCase`
   - Private members: `_prefixed`

4. **Code Organization**
   - One class per file (except small helpers)
   - Logical folder structure
   - Group related functionality

5. **Error Handling**
   - Use Either<Failure, T> pattern
   - Custom exceptions and failures
   - User-friendly error messages

### Quality Checks

Before submitting PR, ensure:

```bash
# No analyzer warnings
flutter analyze
# Output: No issues found!

# Code is formatted
dart format .
# Output: Formatted X files

# Tests pass
flutter test
# Output: All tests passed!

# Build succeeds
flutter build apk
# Output: ✓ Built build/app/outputs/flutter-apk/app-debug.apk
```

---

## 🧪 Testing Guidelines

### What to Test

1. **Unit Tests** - Business logic
   - Use cases
   - Repository implementations
   - Models/Entities

2. **Widget Tests** - UI components
   - Individual widgets
   - Widget interactions
   - State changes

3. **Integration Tests** - Full flows
   - User journeys
   - API integration
   - Navigation flows

### Test Structure

```dart
// Arrange
final repository = MockCharacterRepository();
final useCase = GetCharacters(repository);
const params = GetCharactersParams(page: 1);

// Act
final result = await useCase(params);

// Assert
expect(result, isA<Right>());
```

### Test Naming

```dart
// ✅ Good - Descriptive
test('should return Right with characters when repository call succeeds', () {});
test('should return Left with ServerFailure when repository throws ServerException', () {});

// ❌ Bad - Not descriptive
test('test1', () {});
test('works', () {});
```

---

## 🚫 What NOT to Commit

### Never Commit:

- ❌ API keys or secrets
- ❌ `.env` files with credentials
- ❌ IDE-specific files (except `.vscode/` configuration)
- ❌ Build artifacts (`build/`, `*.apk`, `*.ipa`)
- ❌ Large binary files
- ❌ Personal configuration files
- ❌ Commented-out code (use git instead)
- ❌ Console logs for debugging
- ❌ TODO comments (create issues instead)

### .gitignore Should Include:

```gitignore
# Build outputs
build/
*.apk
*.ipa

# IDE
.idea/
*.iml
.vscode/launch.json

# Dependencies
.dart_tool/
.packages
pubspec.lock

# Environment
.env
.env.local
```

---

## 🎯 Issue Labels

Understanding issue labels:

| Label | Meaning |
|-------|---------|
| `bug` | Something isn't working |
| `feature` | New feature request |
| `documentation` | Documentation improvements |
| `good first issue` | Good for newcomers |
| `help wanted` | Extra attention needed |
| `enhancement` | Improve existing feature |
| `refactor` | Code restructuring |
| `performance` | Performance improvements |
| `security` | Security-related issue |
| `blocked` | Blocked by other work |
| `wontfix` | This will not be worked on |

---

## 🏆 Recognition

Contributors will be recognized in:
- README.md contributors section
- Release notes
- Project documentation

---

## ❓ Questions?

- **General Questions:** Create a discussion thread
- **Bug Reports:** Create an issue with bug template
- **Feature Requests:** Create an issue with feature template
- **Security Issues:** Email directly to maintainers (don't create public issue)

---

## 📜 License

By contributing, you agree that your contributions will be licensed under the same license as the project.

---

**Thank you for contributing! 🎉**

*Last Updated: February 3, 2026*
