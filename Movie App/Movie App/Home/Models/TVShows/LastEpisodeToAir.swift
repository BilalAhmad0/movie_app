//
//  Last_episode_to_air.swift
//  Movie App
//
//  Created by Bilal Ahmad on 31/03/2024.
//

import Foundation
struct LastEpisodeToAir : Codable {
	let id : Int?
	let name : String?
	let overview : String?
	let vote_average : Int?
	let vote_count : Int?
	let air_date : String?
	let episode_number : Int?
	let episode_type : String?
	let production_code : String?
	let runtime : Int?
	let season_number : Int?
	let show_id : Int?
	let still_path : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case overview = "overview"
		case vote_average = "vote_average"
		case vote_count = "vote_count"
		case air_date = "air_date"
		case episode_number = "episode_number"
		case episode_type = "episode_type"
		case production_code = "production_code"
		case runtime = "runtime"
		case season_number = "season_number"
		case show_id = "show_id"
		case still_path = "still_path"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		overview = try values.decodeIfPresent(String.self, forKey: .overview)
		vote_average = try values.decodeIfPresent(Int.self, forKey: .vote_average)
		vote_count = try values.decodeIfPresent(Int.self, forKey: .vote_count)
		air_date = try values.decodeIfPresent(String.self, forKey: .air_date)
		episode_number = try values.decodeIfPresent(Int.self, forKey: .episode_number)
		episode_type = try values.decodeIfPresent(String.self, forKey: .episode_type)
		production_code = try values.decodeIfPresent(String.self, forKey: .production_code)
		runtime = try values.decodeIfPresent(Int.self, forKey: .runtime)
		season_number = try values.decodeIfPresent(Int.self, forKey: .season_number)
		show_id = try values.decodeIfPresent(Int.self, forKey: .show_id)
		still_path = try values.decodeIfPresent(String.self, forKey: .still_path)
	}

}
