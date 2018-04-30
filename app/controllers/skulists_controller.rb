class SkulistsController < ApplicationController

    def proc
        # require 'smarter_csv'
        # options = {headers_in_file: true}
        # SmarterCSV.process('./CSV/SkuList.csv', options) do |chunk|
        #     chunk.each do |data_hash|
        #         Skulist.create!(sku: data_hash[:sku], description: data_hash[:description], model_number: data_hash[:model_number])
                
        #     end
        # end
        # return redirect_to users
    end

end
