require "pry"

def get_first_name_of_season_winner(data, season)
    result = []
	data.each do |season_hash, contestant_hash|
        if season_hash == season
            contestant_hash.each do |contestant|
                contestant.each do |category, value|
                    if value == "Winner"
                        result << contestant["name"]
                    end
                end
            end
        end
    end
    result.join.split[0]
end

def get_contestant_name(data, occupation)
    result = []
    data.each do |season_hash, contestant_hash|
        contestant_hash.each do |contestant|
            contestant.each do |category, value|
                if value == occupation
                    result << contestant["name"]
                end
            end
        end
    end
    result.join
end

def count_contestants_by_hometown(data, hometown)
    counter = 0
    data.each do |season_hash, contestant_hash|
        contestant_hash.each do |contestant|
            contestant.each do |category, value|
                if value == hometown
                    counter += 1
                end
            end
        end
    end
    counter
end

def get_occupation(data, hometown)
    result = []
    data.each do |season_hash, contestant_hash|
        contestant_hash.each do |contestant|
            contestant.each do |category, value|
                if value == hometown
                    result << contestant["occupation"]
                end
            end
        end
    end
    result[0]
end

def get_average_age_for_season(data, season)
    result = []
    data.each do |season_hash, contestant_hash|
        if season_hash == season
            contestant_hash.each do |contestant|
                contestant.each do |category, value|
                    if category == "age"
                        result << value.to_f
                    end
                end
            end
        end
    end
   (result.reduce(:+)/result.length).round
end
