require 'rails_helper'

RSpec.describe 'Group Events API', type: :request do
  let(:user) { create(:user) }
  let(:user_id) { user.id }
  let!(:group_events) { create_list(:group_event, 10, user_id: user_id) }
  let(:group_event_id) { group_events.first.id }

  describe 'GET /group_events' do
    before { get '/group_events' }

    it 'returns group_events' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /group_events/:id' do
    before { get "/group_events/#{group_event_id}" }

    context 'when the record exists' do
      it 'returns the group_event' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(group_event_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:group_event_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find GroupEvent with 'id'=/)
      end
    end
  end

  describe 'POST /group_events' do
    let(:valid_attributes) { { user_id: user_id, name: 'Test', location: 'BSAS', description: 'Test',
                            start_date: Time.zone.now.to_date, end_date: (Time.zone.now.to_date + 6) } }

    context 'when the request is valid' do
      before { post '/group_events', params: valid_attributes }

      it 'creates a group_event' do
        expect(json['name']).to eq('Test')
        expect(json['duration']).to eq(7)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/group_events', params: { name: 'Test' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: User must exist, Start date can't be blank, End date can't be blank/)
      end
    end

    context 'when the request is invalid with published on true' do
      before { post '/group_events', params: { published: true, name: 'Test' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: User must exist, Start date can't be blank, End date can't be blank, Description can't be blank, Location can't be blank/)
      end
    end
  end

  describe 'PUT /group_events/:id' do
    let(:valid_attributes) { { user_id: user_id, name: 'Test EDIT' } }

    context 'when the record exists' do
      before { put "/group_events/#{group_event_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'PUT /group_events/:id' do
    let(:valid_attributes) { { published: true, location: 'CABA', description: 'Test EDIT'} }

    context 'when the record exists  with published on true' do
      before { put "/group_events/#{group_event_id}", params: valid_attributes }

      it 'publish the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /group_events/:id' do
    before { delete "/group_events/#{group_event_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end