class FoosController < ApplicationController
  def index
    foos = FooResource.all(params)
    respond_with(foos)
  end

  def show
    foo = FooResource.find(params)
    respond_with(foo)
  end

  def create
    foo = FooResource.build(params)

    if foo.save
      render jsonapi: foo, status: 201
    else
      render jsonapi_errors: foo
    end
  end

  def update
    foo = FooResource.find(params)

    if foo.update_attributes
      render jsonapi: foo
    else
      render jsonapi_errors: foo
    end
  end

  def destroy
    foo = FooResource.find(params)

    if foo.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: foo
    end
  end
end
