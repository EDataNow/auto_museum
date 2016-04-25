# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Story.delete_all
story_1 = Story.create!(title: 'Story1',
                 description: 'Story Onenizzle Lorem ipsizzle dolizzle sizzle daahng dawg,
                               bling bling adipiscing crazy.')
story_2 = Story.create!(title: 'Story2',
                 description: 'Story Twizzle Lorem ipsizzle dolizzle sizzle daahng dawg,
                               bling bling adipiscing crazy.')
story_3 = Story.create!(title: 'Story3',
                 description: 'Story Thrizzle Lorem ipsizzle dolizzle sizzle daahng dawg,
                               bling bling adipiscing crazy.')


Chapter.delete_all
Chapter.create!(title: 'Truck History',
             position: 1,
                video: '',
                  pdf: Rails.root.join("public/seed/pdf.pdf").open,
                audio: '',
                story: story_1)

Chapter.create!(title: 'Truck History 2',
             position: 2,
                video: '',
                  pdf: Rails.root.join("public/seed/pdf.pdf").open,
                audio: '',
                story: story_1)

Chapter.create!(title: 'Truck History 3',
             position: 3,
                 video: '',
                   pdf: Rails.root.join("public/seed/pdf.pdf").open,
                 audio: '',
                story: story_1)

Chapter.create!(title: 'Truck History 4',
             position: 4,
                 video: '',
                   pdf: Rails.root.join("public/seed/pdf.pdf").open,
                 audio: '',
                story: story_1)
# . . .


Chapter.create!(title: 'Sedan History',
             position: 1,
                 video: '',
                   pdf: Rails.root.join("public/seed/pdf.pdf").open,
                 audio: '',
                story: story_2)

Chapter.create!(title: 'Sedan History 2',
             position: 2,
                 video: '',
                   pdf: Rails.root.join("public/seed/pdf.pdf").open,
                 audio: '',
                story: story_2)
# . . .


Chapter.create!(title: 'Electric Vehicle History',
             position: 1,
                video: '',
                  pdf: Rails.root.join("public/seed/pdf.pdf").open,
                audio: '',
                story: story_3)

Chapter.create!(title: 'Electric Vehicle History 2',
              position: 2,
                 video: '',
                   pdf: Rails.root.join("public/seed/pdf.pdf").open,
                 audio: '',
                 story: story_3)

Chapter.create!( title: 'Electric Vehicle History 3',
              position: 3,
                 video: '',
                   pdf: Rails.root.join("public/seed/pdf.pdf").open,
                 audio: '',
                 story: story_3)
# . . .

User.delete_all
User.create!(name: 'admin',
  password_digest: BCrypt::Password.create('admin'))
