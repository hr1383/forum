class UmvoxEmailer < MandrillMailer::TemplateMailer

  def welcome(user)
    mandrill_mail template: 'umvox-signup',
                  subject: 'Thanks for signing up',
                  to: user.email,
                  from: ENV['DEFAULT_VOX_MAIL'],
                  vars: {
                    'FIRST_NAME' => user.firstname
                  },
                  important: true,
                  inline_css: true                  
                  
  end

  def vox_info(post)
    u = User.find(post.user_id)
    details = Detailinfo.find(post.id)
  	output = "<p>First Name : #{u.firstname}</p>
  	</br><p> Last name: #{u.lastname}</p>
  	</br><p> Email : #{u.email}</p>
  	</br><p>Details : #{details.description}</p>
    </br><p>Url : #{post.urlValue}"
    mandrill_mail template: 'umvox-info',
                  subject: 'New vox is here ',
                  to: ENV['SUPPORT_VOX_MAIL'],
                  from:ENV['DEFAULT_VOX_MAIL'],
                  vars: {
                    'INFO' => output
                  },

                  # to: invitation.email,
                  # to: { email: invitation.email, name: 'Honored Guest' },
                  # vars: {
                  #   'OWNER_NAME' => invitation.owner_name,
                  #   'PROJECT_NAME' => invitation.project_name
                  # },
                  important: true,
                  inline_css: true  	
  end
end