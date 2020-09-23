class SearchSamplesService
  def self.search(search)
    Sample.where('ロケーション LIKE(?)',"%#{search}%")
  end
  
end
#サービスクラス結局機能せず、現在未使用