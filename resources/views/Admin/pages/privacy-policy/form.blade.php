{{ Form::open(['url' => route('admin.privacy-policy.save', $model->id)]) }}
<div class="form-group has-feedback">
    {!! Form::label('question', 'Question:', ['class' => 'control-label']) !!}
    {!! Form::text('question', $model->question, ['id' => 'question', 'class' => 'form-control', 'required']) !!}
</div>
<div class="form-group has-feedback">
    {!! Form::label('answer', 'Answer:', ['class' => 'control-label']) !!}
    {!! Form::textarea('answer', $model->answer, ['id' => 'editor0', 'class' => 'form-control']) !!}
</div>
<div class="form-group has-feedback">
    <div style="float:right;">
        <div class="btn-group">
            <a class="btn btn-lg btn-dark" href="{{ route('admin.privacy-policy.index') }}">Back to questions</a>
            {{ Form::submit('Submit', ['class' => 'btn btn-primary btn-lg']) }}
        </div>
    </div>
</div>
{{ Form::close() }}

<style>
    form {width: 100%;}
</style>
