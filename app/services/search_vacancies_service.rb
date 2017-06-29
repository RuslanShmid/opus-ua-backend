class SearchVacanciesService

  def initialize(title: nil, category: nil, city: nil, page: nil, per: nil, job_type: nil, prMn: nil, prMx: nil)
    @title = title unless title.to_s.empty?
    @category = category unless category.to_s.empty?
    @city = city unless city.to_s.empty?
    @page = page.to_i unless page.to_s.empty?
    @per = per.to_i unless per.to_s.empty?
    @job_type = job_type unless job_type.to_s.empty?
    @prMn = prMn.to_i unless prMn.to_s.empty?
    @prMx = prMx.to_i unless prMx.to_s.empty?
    @vacancies = Vacancy.order(:id).reverse_order
  end

  def perform
    vacancies
    paginate if @page && @per
    @vacancies
  end

  private

  def vacancies
    if @job_type
      @job_type = @job_type.split('|') 
      @job_type = @job_type.map {|item| 
        item.insert(0, '%')
        item.insert(-1, '%')
        item.insert(0, "'")
        item.insert(-1, "'")
      }
      @vacancies = @vacancies.where("lower(job_type) iLIKE #{@job_type.join(' OR lower(job_type) LIKE ')}")
    end
    @vacancies = @vacancies.where("price_per_hour <= #{@prMx}") if @prMx
    @vacancies = @vacancies.where("price_per_hour >= #{@prMn}") if @prMn
    @vacancies = @vacancies.where("lower(category) LIKE ?", "%#{@category.mb_chars.downcase}%") if @category
    @vacancies = @vacancies.where("lower(title) LIKE ?", "%#{@title.mb_chars.downcase}%") if @title
    @vacancies = @vacancies.where("lower(city) LIKE ?", "%#{@city.mb_chars.downcase}%") if @city
    @vacancies
  end

  def paginate
    @vacancies = @vacancies.order(:id).page(@page).per(@per)
  end
end
