munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)

# the object_id of the hash munsters gets passed into the method as an argument
# (not the value of the object)
# and so demo_hash is now pointing to the same object called munsters
# this program does not create a new hash and uses the same hash as munsters
# therefore, the method is messing with the same munsters hash outside the method
