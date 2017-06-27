class SearchVacanciesService

  def initialize(title: nil, category: nil, city: nil, page: nil, per: nil, job_type: nil, prMn: nil, prMx: nil)
    @title = title unless title.empty?
    @category = category unless category.empty?
    @city = city unless category.empty?
    @page = page.to_i unless page.empty?
    @per = per.to_i unless per.empty?
    @job_type = job_type unless job_type.empty?
    binding.pry
    @prMn = prMn.to_i unless prMn.empty?
    @prMx = prMx.to_i unless prMx.empty?
    @vacancies = Vacancy.order(:id).reverse_order
  end

  def perform
    vacancies
    paginate if @page && @per
    @vacancies
  end

  private

  def vacancies
    @vacancies = @vacancies.where("price_per_hour <= #{@prMx}") if @prMx
    binding.pry
    @vacancies = @vacancies.where("price_per_hour >= #{@prMn}") if @prMn
    @vacancies = @vacancies.where("lower(job_type) LIKE ?", "%#{@job_type.mb_chars.downcase}%") if @job_type
    @vacancies = @vacancies.where("lower(title) LIKE ?", "%#{@title.mb_chars.downcase}%") if @title
    @vacancies = @vacancies.where("lower(category) LIKE ?", "%#{@category.mb_chars.downcase}%") if @category
    @vacancies = @vacancies.where("lower(city) LIKE ?", "%#{@city.mb_chars.downcase}%") if @city
    @vacancies
  end

  def paginate
    @vacancies = @vacancies.order(:id).page(@page).per(@per)
  end
end
