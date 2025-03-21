# Policies

---

## Overview

This repository is a demo project that showcases how to deploy **Fianu YAML-based configuration**. This repository includes sample YAML files and demonstrates how to deploy them using the following command:

```bash
fianu console deploy <path to file or directory>
fianu console deploy "simple/*" --commits-only="false" --dry-run="false" --commit aff2131cbdf6e4b5abb4bf78cf08ec4f2ca483eb
fianu console deploy "simple/*" --repository policies --commits-only="false" --dry-run="false" --commit aff2131cbdf6e4b5abb4bf78cf08ec4f2ca483eb
```

---

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Troubleshooting](#troubleshooting)

---

## Features

- **Declarative Configuration:** Define Fianu console resources in human-readable YAML.
- **Automated Deployment:** Deploy configurations seamlessly with a single command.
- **Version Control Integration:** Track changes and manage deployments using Git.
- **Modular Templates:** Easily extend and customize your entity definitions.

---

## Prerequisites

Before you begin, ensure you have:

- [Fianu CLI](https://fianu.example.com) installed on your system.
- [Git](https://git-scm.com/) for version control.
- Basic knowledge of YAML and command-line operations.

---

## Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/yourusername/entities-as-code.git
   cd entities-as-code
   ```

2. **Install the Fianu CLI**

   Follow the installation instructions on the [Fianu CLI documentation page](https://docs.fianu.io/cli/quick_start).

---

## Usage

Deploy your YAML-based Fianu entities with the following command:

```bash
fianu console deploy <path to file or directory>
```

### Examples

- **Deploy a Single File**

  ```bash
  fianu console deploy entities/my-entity.yaml
  ```

- **Deploy an Entire Directory**

  ```bash
  fianu console deploy entities/*
  ```

The command will parse the YAML files at the specified path and deploy the entities based on the defined configuration. Monitor the output for confirmation messages or any error logs.

---

## Troubleshooting

- **YAML Parsing Errors:**  
  Ensure your YAML files are properly formatted. Use a YAML linter to validate the syntax.

- **CLI Not Found:**  
  Verify that the Fianu CLI is installed and added to your system’s PATH.

- **Permission Issues:**  
  Check that you have the required permissions to execute the deployment command.

For further assistance, refer to the [Fianu documentation](https://docs.fianu.io/cli) or open an issue with support@fianu.io

---
