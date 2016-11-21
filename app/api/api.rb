# encoding: UTF-8
class API < Grape::API
  prefix 'api'
  format :json

  helpers do
    def return_fail message='失败'
      {:error => message}
    end

    def array_to_hash data, param = 'id'
      return return_fail if data.blank?
      data_hash = {}
      data.each do |datum|
        return return_fail if datum[param].blank?
        data_hash[datum[param]] = datum
      end
      data_hash
    end

    def hash_to_hash data, param = 'id'
      return return_fail if data.blank? || data[param].blank?
      { data[param] => data }
    end
  end

  get :GetFail do
    return_fail
  end
end
