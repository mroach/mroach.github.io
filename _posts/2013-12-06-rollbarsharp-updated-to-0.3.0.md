---
title: RollbarSharp updated to 0.3.0
---

The new release adds two bits of missing functionality.

### Session data

Data from the `Session` object is now added to reports. Data is described/stringified as best we can, with non-value types being reported with their type name, hash code, and `.ToString()` value.

### Param scrubbing

Sensitive paramter values are now scrubbed. Each character is replaced with an asterisk.
