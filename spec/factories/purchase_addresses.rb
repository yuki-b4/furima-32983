FactoryBot.define do
  factory :purchase_address do
    post {"234-1111"}
    city {"新潟市"}
    address {"投下米2-1-32"} 
    phone {"09011111111"}
    shipping_from_id {4}
    token {"tk_00000000003rweqf"}
  end
end
