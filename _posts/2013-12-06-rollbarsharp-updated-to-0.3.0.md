---
layout: post
title: RollbarSharp updated to 0.3.0
---

The new release adds two bits of missing functionality.

### Session data

Data from the `Session` object is now added to reports. Data is described/stringified as best we can, with non-value types being reported with their type name, hash code, and `.ToString()` value.

### Param scrubbing

Sensitive paramter values are now scrubbed. Each character is replaced with an asterisk. By default, any parameter in the following list will be scrubbed:

<p><code>password password_confirmation confirm_password secret secret_token creditcard credit_card credit_card_number card_number ccnum cc_number</code></p>

You can override this list by setting the `Rollbar.ScrubParams` configuration option.


[View RollbarSharp on GitHub](https://github.com/mroach/rollbarsharp)
