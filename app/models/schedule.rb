class Schedule < ApplicationRecord
	belongs_to :tourist
	belongs_to :guide

	enum status: {依頼中: 0, 実施不可: 1, 実施予定: 2, 実施済み: 3}
end
