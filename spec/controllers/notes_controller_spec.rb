require 'rails_helper'

RSpec.describe NotesController, :type => :controller do



  describe '#index'  do
    before do
      @notes = create_list(:note, 3)
    end
    it 'displays a collection of notes' do
      get :index
      expect(response).to be_success
      expect(assigns(:notes).count).to eq 3
      expect(response).to render_template('index')
    end
  end

  describe '#show'  do
    before do
      @note = create(:note, text: 'my little note')
    end
    it 'displays a single note' do
      get :show, id: @note.id
      expect(response).to be_success
      expect(assigns(:note).text).to eq 'my little note'
      expect(response).to render_template('show')
    end
  end

  describe '#new'  do
    it 'sets up a new note instance' do
      get :new
      expect(response).to be_success
      expect(assigns(:note)).to be_new_record
      expect(response).to render_template('new')
    end
  end

  describe '#create'  do
    context 'when saving a proper record' do
      it 'creates a new note and saves it to the db' do
        expect {
          post :create, note: {text: 'a new note'}
        }.to change(Note, :count).by(1)
      end
    end
    context 'when the record fails to save' do
      it 'renders the new template and does not save to the db' do
        post :create, note: {text: nil}
        expect(response).to render_template('new')
        expect(Note.count).to eq 0
      end
    end
  end

  describe '#edit' do
    before do
      @note = create(:note)
    end
    it 'displays the note I want to edit' do
      get :edit, id: @note.id
      expect(response).to be_success
      expect(assigns(:note).id).to eq @note.id
      expect(response).to render_template('edit')
    end
  end

  describe '#update' do
  # hint 2
    before do
     @note = create(:note, text: "this")
    end
    context 'when the update was successful' do
      it 'updates the text from "this" to "that" and redirects to the notes index page' do

        put :update, id: @note.id, note: {text: "that"}
        expect(@note.reload.text).to eq "that"
        expect(response).to be_redirect
        expect(response).to redirect_to notes_path
      end
    end
    context 'when the update failed' do
      it 'fails to update the text from "this" to nil and renders the edit template' do
        put :update, id: @note.id, note: {text: nil}
        expect(@note.reload.text).to_not be_nil
        expect(response).to render_template("edit")
      end
    end
  end

# mine:
    # context 'when updating a current record' do
    #   it 'updates a current record and saves it to the db' do
    #     expect{
    #       patch :create, note: {text: 'a new note'}
    #     }.to change(Note, :count).by(1)
    #   end
    # end
    # context 'when the record fails to update' do
    #   it 'does not update and save the record' do
    #     patch :create, note: {text: nil}
    #     expect(response).to render_template('show')
    #     expect(Note.count).to eq 0
    #   end
  #   end
  # end


  describe '#destroy'  do
    before do
      @note = create(:note)
    end
      it 'removes the note from the database' do
        expect {
          delete :destroy, id: @note.id
        }.to change(Note, :count).from(1).to(0)
        expect(response).to be_redirect
        expect(response).to redirect_to notes_path
      end
  end
end


# index
# show
# new
# create
# edit
# update
# destroy
