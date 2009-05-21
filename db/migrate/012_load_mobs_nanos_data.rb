class LoadMobsNanosData < ActiveRecord::Migration
  def self.up
    down

    mobs_and_nanos = [
      [ "Cultist", [ "Ire of the Immortal", "Blessing of the Immortal", "Mighty Challenger to Cyclops" ] ],
      [ "Acolyte Betany", [ "Rage of the Immortal" ] ],
      [ "Acolyte Felid", [ "Boon of the Immortal" ] ],
      [ "Reverend Gulard", [ "Gift of the Immortal" ] ],
      [ "Reverend Julaan", [ "Smother Fury", "Minor Shutdown" ] ],
      [ "Reverend Oluay", [ "Presence of the Immortal" ] ],
      [ "Reverend Saxx", [ "Minor Shutdown" ] ],
      [ "Exarch Ecclese", [ "Resentment of the Immortal", "Devastation of the Immortal" ] ],
      [ "Exarch Li-Po", [ "Minor Shutdown" ] ],
      [ "Exarch Truan", [ "Chant of the Immortal" ] ],
      [ "Defender of the Three", [ "Virulence of the Immortal", "Devastation of the Immortal" ] ],
      [ "Lien the Memorystalker", [ "Cataclysm of the Immortal" ] ]
    ]

    for m in mobs_and_nanos
      mob = Mob.find_by_name(m[0]) 
      for n in m[1]
        mob.nanos << Nano.find_by_name(n)
      end
    end
  end

  def self.down
    MobsNano.delete_all
  end
end
