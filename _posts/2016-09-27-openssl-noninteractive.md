---
layout: post
title: openssl non-interactive
categories:
  - cheatsheet
tags:
  - openssl
  - ssl
---

Using `openssl` with the `--subject` argument allows you to generate certificates
without being prompted for any input. This non-interactive mode makes server
automation that much easier.

{% highlight bash %}
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout testapp.key -out testapp.crt \
-subj /C=CA/ST=Quebec/L=Montreal/O=Poutine LLC/OU=devops/CN=*.poutine.net
{% endhighlight %}

### Subject vars

<table>
  <tr>
    <th>C</th>
    <td>ISO country code</td>
  </tr>

  <tr>
    <th>ST</th>
    <td>State/Province/Subdivision</td>
  </tr>

  <tr>
    <th>L</th>
    <td>Locality/City/Town</td>
  </tr>

  <tr>
    <th>O</th>
    <td>Organisation/Company</td>
  </tr>

  <tr>
    <th>OU</th>
    <td>Organisational Unit/Department</td>
  </tr>

  <tr>
    <th>CN</th>
    <td>Common name. The most important! Your domain name! Wildcards supported.</td>
  </tr>
</table>
