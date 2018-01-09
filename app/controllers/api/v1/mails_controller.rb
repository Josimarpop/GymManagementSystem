module Api
  module V1
    class MailsController < AuthorizationsController

      def create
        send_mails_to_users
      end


      private

      def send_mails_to_users
        User.where(id: mail_params[:user_ids]).each do |user|
            CustomMailer.custom_mail(user, mail_params).deliver_now
        end
      end

      def mail_params
        params.require(:mail).permit( :subject, :body,user_ids: [])
      end
    end
  end
end
