### CREATE USERS

  def gen_username(i)
    i <= 1 ?  "user#{i}" : Faker::Internet.user_name
  end

  def gen_password(i)
    i <= 1 ? '123' : Faker::Internet.password
  end

  10.times do |i|

    User.create(
      username: gen_username(i),
      password: gen_password(i),
      email: Faker::Internet.email
    )

  end

  User.all.each do |user|

### CREATE QUESTIONS

    (3 + rand(7)).times do

      Question.create(
        user_id: user.id,
        title: Faker::Lorem.sentence(word_count = 5, supplemental = false, random_words_to_add = 0),
        body: Faker::Lorem.sentence(word_count = 10 + rand(90), supplemental = false, random_words_to_add = 0)
      )

    end

    Question.where(user_id: user.id).each do |question|

### CREATE ANSWERS

      User.all.each do |user|

        if rand(3) == 2
          Answer.create(
            user_id: user.id,
            question_id: question.id,
            body: Faker::Lorem.sentence(word_count = 10 + rand(90), supplemental = false, random_words_to_add = 0)
          )
        end

### VOTE QUESTIONS

        if rand(3) == 2
          Vote.create(
            user_id: user.id,
            article_id: question.id,
            article_type: 'Question'
          )
        end

      end

      question.answers.each do |answer|

### CREATE COMMENTS

        User.all.each do |user|

          if rand(3) == 2
            Comment.create(
              user_id: user.id,
              article_id: answer.id,
              article_type: 'Answer',
              body: Faker::Lorem.sentence(word_count = 10 + rand(90), supplemental = false, random_words_to_add = 0)
            )
          end

### VOTE ANSWERS

          if rand(3) == 2
            Vote.create(
            user_id: user.id,
            article_id: answer.id,
            article_type: 'Answer'
            )
          end

        end

        answer.comments.each do |comment|

### CREATE SUB-COMMENTS

          User.all.each do |user|

            if rand(3) == 2
              Comment.create(
                user_id: user.id,
                article_id: comment.id,
                article_type: 'Comment',
                body: Faker::Lorem.sentence(word_count = 10 + rand(90), supplemental = false, random_words_to_add = 0)
              )
            end

### VOTE COMMENTS

            if rand(3) == 2
              Vote.create(
              user_id: user.id,
              article_id: comment.id,
              article_type: 'Comment'
              )
            end

          end

        end

      end

    end

  end
