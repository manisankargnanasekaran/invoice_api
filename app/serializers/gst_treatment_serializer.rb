class GstTreatmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :gst_required
end
