module Helpers
  def decoded_body
    @_decoded_body ||=
        begin
          JSON.parse(response.body).with_indifferent_access
        rescue StandardError
          nil
        end
  end
end