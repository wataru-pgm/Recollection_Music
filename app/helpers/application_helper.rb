module ApplicationHelper
  def default_meta_tags
    {
      title: 'Re:Collect',
      reverse: true,
      charset: 'utf-8',
      description: '音楽と思い出を共有するSNSアプリ',
      keywords: '音楽, 想い出, 共有, Re:Collect, リコレクト',
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: image_url('favicon.png') },
        { href: image_url('favicon.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' }
      ],
      og: {
        site_name: 'Re:Collect',
        title: 'Re:Collect',
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@wataru_pgm'
      }
    }
  end
end
