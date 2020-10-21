# encoding: UTF-8

RSpec.describe 'class/io/dir.rb' do
  let(:path_spec){"#{💎.engine.path_base}spec/"}
  let(:dir_identical_a){::Dir.new("#{path_spec}helpers/io_test_setup/container_a/identical_dir/")}
  let(:dir_identical_b){::Dir.new("#{path_spec}helpers/io_test_setup/container_b/identical_dir/")}
  let(:dir_identical_c){::Dir.new("#{path_spec}helpers/io_test_setup/container_c/identical_dir/")}
  let(:dir_identical_d){::Dir.new("#{path_spec}helpers/io_test_setup/container_d/identical_dir/")}

  let(:dir_identical_a_sub_ab){::Dir.new("#{path_spec}helpers/io_test_setup/container_a/identical_dir/sub_a/sub_b")}
  let(:dir_identical_b_sub_ab){::Dir.new("#{path_spec}helpers/io_test_setup/container_b/identical_dir/sub_a/sub_b")}

  let(:file_a){"#{path_spec}helpers/io_test_setup/container_a/identical_dir/static_test_data.rb"}
  let(:file_b){"#{path_spec}helpers/io_test_setup/container_b/identical_dir/static_test_data.rb"}
  let(:file_c){"#{path_spec}helpers/io_test_setup/container_c/identical_dir/static_test_data.rb"}
  let(:file_d){"#{path_spec}helpers/io_test_setup/container_d/identical_dir/static_test_data.rb"}

  context 'extends class[Dir]' do

    context 'by adding "static" function{∃?}' do
      context 'handles needed scenarios' do
        # positive cases intentionally omitted for time being
        it 'cases: error' do
          expect{::Dir.∃?(nil)}.to raise_error(ArgumentError)
        end
      end
    end

    context 'by adding func{path_overlap}' do
      context 'handles needed scenarios' do
        context 'cases: positive' do
          it 'w/ dir comparisons' do
            a_a = dir_identical_a.path_overlap(dir_identical_a)
            a_b = dir_identical_a.path_overlap(dir_identical_b)
            a_c = dir_identical_a.path_overlap(dir_identical_c)
            a_d = dir_identical_a.path_overlap(dir_identical_d)

            b_b = dir_identical_b.path_overlap(dir_identical_b)
            b_a = dir_identical_b.path_overlap(dir_identical_a)
            b_c = dir_identical_b.path_overlap(dir_identical_c)
            b_d = dir_identical_b.path_overlap(dir_identical_d)

            c_c = dir_identical_c.path_overlap(dir_identical_c)
            c_d = dir_identical_c.path_overlap(dir_identical_d)
            d_c = dir_identical_d.path_overlap(dir_identical_c)

            d_d = dir_identical_d.path_overlap(dir_identical_d)

            expect(a_b).to eq(a_c)
            expect(a_b).to eq(a_d)
            expect(b_c).to eq(b_d)

            expect(c_d).to eq(a_b)
            expect(b_a).to eq(d_c)

            expect(a_a).to eq(dir_identical_a.path)
            expect(b_b).to eq(dir_identical_b.path)
            expect(c_c).to eq(dir_identical_c.path)
            expect(d_d).to eq(dir_identical_d.path)
          end
          it 'w/ file & dir comparison' do
            a_b  = dir_identical_a.path_overlap(dir_identical_b)
            b_af = dir_identical_b.path_overlap(file_a)

            expect(a_b).to eq(b_af)
          end
        end
        it 'cases: negative' do
        end
      end
    end

    context 'by adding func{path_overlap_reversed}' do
      context 'handles needed scenarios' do
        context 'cases: positive' do
          it 'w/ dir comparisons' do
            aab = dir_identical_a_sub_ab.path_overlap_reversed(dir_identical_b_sub_ab)
            bab = dir_identical_b_sub_ab.path_overlap_reversed(dir_identical_a_sub_ab)

            expect(aab).to eq(bab)
            expect(aab).to eq('/identical_dir/sub_a/sub_b/')
          end
        end
        context 'cases: negative' do
          it 'w/ file & dir comparison' do
            aab  = dir_identical_a_sub_ab.path_overlap_reversed(dir_identical_b)
            b_af = dir_identical_b.path_overlap_reversed(file_a)

            expect(aab).to eq(b_af)
            expect(aab).to eq(nil)
          end
        end
      end
    end

  end
end
