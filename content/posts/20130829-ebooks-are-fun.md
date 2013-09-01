title: "A Slight Delay"
author: "Finn Mack"
published: "Aug 29, 2013"
---
<figure>
  <img src='/img/printing-press.jpg'/>
  <figcaption>The *Qubit* team hard at work assembling the ebook.</figcaption>
</figure>

Unfortunately, the release of *Qubit* has been delayed because, well, ebooks.

I had originally figured [Scrivener] would allow me to do whatever customizations I needed in compiling the final ebook. After all, it has approximately one billion options. <span class='note'>This is not an exaggeration. Scientists are still discovering new ones.</span> However, it turns out that there are some pretty severe limitations to what you can produce.

[Scrivener]:http://www.literatureandlatte.com/scrivener.php

<!-- more -->

Long story short, with the help of [pandoc] and [textutil], I ended up converting the entire manuscript into [markdown]. Which was sort of an indirect way to control the ebook generation process. This also allowed me to play some other tricks, like programmatically verifying the times and dates in the scene headings. <span class='note'>The reason this was hard was because, well, time zones. They're everywhere. And, for whatever reason, I can't do time zone math reliably to save my life. Fortunately, it seems entirely unlikely that it will come to that.</span>

This meant that I *also* had to learn the nuances of what works and what doesn't for ebooks. This is complicated by the fact that there are a lot of devices an ebook could potentially be displayed on. I've tried to keep it simple, but, even so, the results often surprised me. I'm still learning and, once I'm done, it's still going to take a bit more time to test across devices.

That said, the delay isn't going to be too bad. I'm hoping for Monday.

[pandoc]:http://johnmacfarlane.net/pandoc/
[textutil]:https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/textutil.1.html
[markdown]:http://daringfireball.net/projects/markdown/