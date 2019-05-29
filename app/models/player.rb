# Create Adventurer with Name, Class, HP, WeaponDMG, Alive? Boolean
class Player < ActiveRecord::Base
    has_many :dungeons, through: :dungeon_crawls

    # Attack, Level Up, Status, BattleCry, Min & Max Damage, Attack Accuracy

    # View all current stats of a character
    def status
        puts "Health: #{self.current_hp}/#{self.max_hp}"
        puts "Damage: #{self.min_dmg} to #{self.max_dmg} DMG per attack."
        puts "Accuracy Modifer: #{self.accuracy}% to hit."
        puts "#{self.battlecry}"
    end
    # Rest function resets current health to max health. Will be called when leveled up. 
    def rest
        self.current_hp = self.max_hp
    end
    # Basic attack logic. % Chance to hit (Accuracy Stat), random damage within range if successful (min -> max dmg)
    def attack
        self.dmg - monster.hp
    end
    # Battle option for potential for monster to miss a turn
    def intimidate
        puts "You roar with beastial vigor!"
        sleep(2)
        puts "#{self.battlecry}!!!"
    end
    # Every successful run will increase level and up stats
    def level_up
        self.max_hp + rand(50..75) = self.max_hp
        rest
        self.min_dmg * 1.2 = self.min_dmg
        self.max_dmg * 1.4 = self.max_dmg
        self.accuracy + rand[]
    end

end
