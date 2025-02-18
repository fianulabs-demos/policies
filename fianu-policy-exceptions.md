# Fianu Policy Exceptions

This guide outlines the process for creating a policy exception file in Fianu, explaining each section and providing best practices for accurate and effective configurations.

## 1. **Set the Status**

- **Purpose:** Indicate the current state of the exception.
- **Values:** `active` or `draft`
- **Tip:** Use `active` for implemented policies and `draft` for pending reviews.
```yaml
status: active
```

---

## 2. **Define General Information**

- **Fields:**
  - `name`: Policy title (e.g., 'Unit Test Coverage')
  - `type`: Must be `exception`.
  - `path`: Internal identifier.
```yaml
general:
  policy:
    name: 'Unit Test Coverage'
    type: exception
    path: f.exception.dbx.unit.test.coverage
```

---

## 3. **Specify Control Path**
- **Purpose:** Link the exception to the relevant control.
```yaml
control:
  path: unit.test.coverage
```

---

## 4. **Configure Policy Variations**
- **Fields:**
  - `criteria`: Conditions for rule application.
  - `policy`: Exception rules.
- **Best Practice:** Use criteria for targeted exceptions (e.g., legacy systems).
```yaml
policy:
  - criteria:
      expression: application.path == 'dbx'
    policy:
      required: true
      overall_coverage:
        minimum: 0.5
```

---

## 5. **Provide Justification**
- **Purpose:** Document the reason for the exception.
```yaml
justification:
  message: |
    Legacy Codebase - 50% Coverage allowed.
```

---

## 6. **Set Expiration Date**
- **Purpose:** Define when the exception expires.
- **Format:** ISO8601 (e.g., `2025-03-01T14:56:01Z`)
```yaml
expiration:
  timestamp: '2025-03-01T14:56:01Z'
```

---

## 7. **Declare Applicable Asset Types**
- **Purpose:** Limit the exception's scope.
- **Values:** application, artifact, issue, release, version, module, project, repository
```yaml
override:
  asset:
    types:
      - application
```

---

## **Best Practices for Policy Creation:**
- ✅ Provide clear and descriptive policy names.
- ✅ Use concise, specific justifications.
- ✅ Target exceptions with precise criteria.
- ✅ Assign expiration dates to facilitate reviews.
- ✅ Limit the exception to necessary asset types.

Follow this guide to ensure consistent and effective policy exceptions.