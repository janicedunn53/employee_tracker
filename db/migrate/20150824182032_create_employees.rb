class CreateEmployees < ActiveRecord::Migration
  def change
    create_table(:employees) do |t|
      t.column(:name, :string)
      t.column(:gender, :string)
      t.column(:age, :integer)

      t.timestamps()
    end
  end
end
