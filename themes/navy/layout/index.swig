<header id="banner" class="wrapper">
  <div class="inner">
    <h2 id="banner-title">{{ page.subtitle }}</h2>
    <div id="banner-start">
      <span id="banner-start-command">ebox_init()</span><a id="banner-start-link" href="quickstart/"><i class="fa fa-arrow-right"></i></a>
    </div>
    <div id="banner-share">{{ partial('partial/share') }}</div>
  </div>
</header>
<div id="content-wrap">
  <div class="wrapper">
    <div class="inner">
      {{ page.content }}
      <ul id="intro-cmd-wrap">
        <li class="intro-cmd-item">ebox_init()</li>
        <li class="intro-cmd-item">PB8.mode(OUTPUT_PP)</li>
        <li class="intro-cmd-item">PB8.toggle()</li>
        <li class="intro-cmd-item">delay_ms()</li>
      </ul>
      <div id="intro-get-started-wrap">
        <a href="quickstart/" id="intro-get-started-link">{{ __('index.get_started') }}</a>
      </div>
    </div>
  </div>
</div>